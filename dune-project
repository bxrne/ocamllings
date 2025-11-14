(lang dune 3.20)

(name ocamllings)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Adam Byrne <adamrbyrne@gmail.com>")

(maintainers "Adam Byrne <adamrbyrne@gmail.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name ocamllings)
 (synopsis "Learning OCaml through small coding challenges that are fun and practical")
 (description "Ocamllings is a collection of small coding challenges designed to help you learn OCaml in a fun and practical way. Each challenge focuses on a specific concept or feature of the language, providing hands-on experience and reinforcing your understanding.")
 (depends ocaml)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
