(lang dune 3.0)

(name cephalopod)
(version 0.1)
(generate_opam_files true)
(source
 (github c-cube/cephalopod))
(authors "Simon Cruanes")
(maintainers "Simon Cruanes")
(license MIT)

;(documentation https://url/to/documentation)

(package
 (name cephalopod)
 (synopsis "Core types and algorithms for cephalopod, ATproto tooling")
 (depends
  (ocaml (>= 5.0))
  dune
  (containers (>= 3.13))
  (digestif (>= 1.0))
  ppx_deriving
  ppx_deriving_yojson
  base32
  (yojson (>= 2.0))
  ; mirage-crypto

  (trace :with-test)
  (trace-tef :with-test)
  (thread-local-storage (and (>= 0.2) (< 0.3)))
  (odoc :with-doc)
  (hmap :with-test))
 (depopts
   (trace (>= 0.6)))
 (tags
  (atproto bluesky xrpc dasl)))

 ; moonpool
 ; (picos (and (>= 0.5) (< 0.7)))
 ; (picos_std (and (>= 0.5) (< 0.7)))



; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
