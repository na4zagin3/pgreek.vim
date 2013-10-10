pgreek.vim
==========

Easily-customizable Vim keymap for typing polytonic Greek.

Install
----

If you use NeoBundle, Vundle and so on, add line like following to your .vimrc.

    NeoBundle 'na4zagin3/pgreek.vim'

Or, copy `keymap/pgreek_utf-8.vim` into your `$VIMRUNTIME/keymap` (e.g. `~/.vim/keymap`)


How to Use
----

To use this keymap, set keymap to 'pgreek'. Please check encoding is surely UTF-8.

    :set keymap=pgreek

Example
----

    εἰμί: e>im;i, ei]mi/
    τὸ ζῷον: t`o z~v|on, to\\ zv=|on
    Ϙόρινθος: Qg;orinuow, Qgo/rinuow

Default Keymap
----

### Alphabets

| Letter | Name         | Keymap |
| ------ | ------------ | ------ |
| Α α    | Alpha        | A a    |
| Β β    | Beta         | B b    |
| Γ γ    | Gamma        | G g    |
| Δ δ    | Delta        | D d    |
| Ε ε    | Epsilon      | E e    |
| Ϝ ϝ    | Digamma, Waw | Qf qf  |
| Ͷ ͷ    |              | Qv qv  |
| Ζ ζ    | Zeta         | Z z    |
| Η η    | Eta          | H h    |
| Ͱ ͱ    | Heta         | Qh qh  |
| Θ θ    | Theta        | U u    |
| Ι ι    | Iota         | I i    |
| Κ κ    | Kappa        | K k    |
| Λ λ    | Lambda       | L l    |
| Μ μ    | Mu           | M m    |
| Ν ν    | Nu           | N n    |
| Ξ ξ    | Sigma        | S s    |
| Ο ο    | Omicron      | O o    |
| Π π    | Pi           | P p    |
| Ϻ ϻ    | San          | Qs qs  |
| Ϸ ϸ    | Sho          | Qx qx  |
| Ϙ ϙ    | Qoppa        | Qg qg  |
| Ϟ ϟ    |              | Qq qq  |
| Ρ ρ    | Rho          | R r    |
| Σ σ ς  | Sigma        | S s    |
| Τ τ    | Tau          | T t    |
| Υ υ    | Ypsilon      | Y y    |
| Φ φ    | Phi          | F f    |
| Χ χ    | Chi          | X x    |
| Ψ ψ    | Psi          | C c    |
| Ω ω    | Omega        | V v    |
| Ϡ ϡ    | Sampi        | Qt qt  |
| Ͳ ͳ    |              | Qu qu  |
| Ϛ ϛ    | Stigma       | Qj qj  |
| ϳ      | Jot          | qy     |

### Accents

| Accent            | Prefix Style | Postfix Style |
| ----------------- | ------------ | ------------- |
| Accute            | ;            | /             |
| Grave             | `            | \\            |
| Circumflex        | ~            | =             |
| Diaeresis         | :            | "             |
| Iota subscript    | (None)       | \|            |

### Symbols
