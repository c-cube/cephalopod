use std::io;

use crate::ast;
use crate::ast::Lexicon;
use anyhow::Result;

use ratatui::crossterm::event;
use ratatui::crossterm::event::EnableMouseCapture;
use ratatui::crossterm::event::Event;
use ratatui::crossterm::event::KeyCode;
use ratatui::crossterm::event::MouseButton;
use ratatui::crossterm::event::MouseEvent;
use ratatui::crossterm::event::MouseEventKind;
use ratatui::prelude::*;
use ratatui::widgets::Block;
use ratatui::widgets::Scrollbar;
use ratatui::widgets::ScrollbarOrientation;
use ratatui::Terminal;
use tui_tree_widget::Tree;
use tui_tree_widget::TreeItem;
use tui_tree_widget::TreeState;

#[derive(Debug)]
enum Screen {
    Main,
}

struct App {
    lexicons: Vec<ast::Lexicon>,
    lexicons_ts: TreeState<usize>,
    mouse_ev: Option<MouseEvent>,
    screen: Screen,
}

fn ui(frame: &mut Frame, app: &mut App) -> io::Result<()> {
    let main_area = frame.area();
    // frame.render_widget(ratatui::widgets::Paragraph::new("hello world"), main_area);
    // let list =  widgets::List::new(&app.lexicons).

    fn tree_of_type(_ty: &ast::Type) -> TreeItem<'_, usize> {
        todo!()
    }

    fn tree_of_def(d: &ast::Def) -> io::Result<TreeItem<'_, usize>> {
        let mut children = vec![];

        let mut add_descr = |d: &Option<String>| {
            if let Some(d) = d {
                children.push(TreeItem::new_leaf(children.len(), format!("descr: {d}")))
            }
        };

        let t = match d {
            ast::Def::Query(q) => {
                add_descr(&q.description);
                TreeItem::new(0, "query", children)?
            }
            ast::Def::Procedure(_) => todo!(),
            ast::Def::Record(_) => todo!(),
            ast::Def::Subscription(_) => todo!(),
            ast::Def::Object(_) => todo!(),
            ast::Def::Token(tok) => TreeItem::new_leaf(0, format!("{:?}", tok)),
        };
        Ok(t)
    }

    fn tree_of_lexicon(i: usize, l: &Lexicon) -> io::Result<TreeItem<'_, usize>> {
        let mut children = vec![];
        for (i, (name, def)) in l.defs.iter().enumerate() {
            children.push(TreeItem::new(
                i,
                format!("{}:", name),
                vec![tree_of_def(def)?],
            )?)
        }

        Ok(TreeItem::new(
            i,
            format!("{i:#4}: lexicon {}", l.id),
            children,
        )?)
    }

    let trees: Vec<_> = app
        .lexicons
        .iter()
        .enumerate()
        .map(|(i, l): (usize, &Lexicon)| tree_of_lexicon(i, l))
        .collect::<io::Result<Vec<_>>>()?;

    let scrollbar = Scrollbar::new(ScrollbarOrientation::VerticalRight)
        .begin_symbol(Some("↑"))
        .end_symbol(Some("↓"));
    let ts = Tree::new(&trees)?
        .experimental_scrollbar(Some(scrollbar))
        .block(Block::bordered().title("Lexicons"));

    // handle mouse
    if let Some(event) = app.mouse_ev {
        if event.kind == MouseEventKind::Up(MouseButton::Left)
            && main_area.contains(Position::new(event.column, event.row))
        {
            app.mouse_ev = None;
            app.lexicons_ts
                .click_at(Position::new(event.column, event.row));
        }
    };

    frame.render_stateful_widget(ts, main_area, &mut app.lexicons_ts);

    Ok(())
}

fn run_app<B: Backend>(terminal: &mut Terminal<B>, app: &mut App) -> Result<()> {
    loop {
        terminal.try_draw(|f| ui(f, app))?;
        match event::read()? {
            Event::Key(key) => {
                if key.kind == event::KeyEventKind::Release {
                    // Skip events that are not KeyEventKind::Press
                    continue;
                }

                match key.code {
                    KeyCode::Char('q') => break,
                    KeyCode::Up => {
                        app.lexicons_ts.scroll_up(1);
                    }
                    KeyCode::PageUp => {
                        app.lexicons_ts.scroll_up(10);
                    }
                    KeyCode::Down => {
                        app.lexicons_ts.scroll_down(1);
                    }
                    KeyCode::PageDown => {
                        app.lexicons_ts.scroll_down(10);
                    }
                    _ => (),
                }

                // TODO: move tabs on 'tab'
            }
            Event::Mouse(MouseEvent {
                kind: MouseEventKind::ScrollUp,
                ..
            }) => {
                app.lexicons_ts.scroll_up(1);
            }
            Event::Mouse(MouseEvent {
                kind: MouseEventKind::ScrollDown,
                ..
            }) => {
                app.lexicons_ts.scroll_down(1);
            }
            Event::Mouse(ev) => {
                app.mouse_ev = Some(ev);
            }
            _ => (),
        }
    }
    Ok(())
}

pub fn explore(lexicons: Vec<ast::Lexicon>) -> Result<()> {
    let mut terminal = ratatui::init();
    ratatui::crossterm::execute!(std::io::stdout(), EnableMouseCapture)?;

    // create app and run it
    let mut app = App {
        lexicons,
        screen: Screen::Main,
        lexicons_ts: Default::default(),
        mouse_ev: None,
    };
    let res = run_app(&mut terminal, &mut app);

    // cleanup
    ratatui::restore();

    res?;
    Ok(())
}
