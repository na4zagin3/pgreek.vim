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
    τὸ ζῷον: t`o z~v|on, to\ zv=|on
    Ϙόρινθος: Qg;orinuow, Qgo/rinuow

Default Keymap
----

### Alphabets

| Letter | Name         | Keymap     |
| ------ | ------------ | ---------- |
| Α α    | Alpha        | `A` `a`    |
| Β β    | Beta         | `B` `b`    |
| Γ γ    | Gamma        | `G` `g`    |
| Δ δ    | Delta        | `D` `d`    |
| Ε ε    | Epsilon      | `E` `e`    |
| Ϝ ϝ    | Digamma, Waw | `Qf` `qf`  |
| Ͷ ͷ    |              | `Qv` `qv`  |
| Ζ ζ    | Zeta         | `Z` `z`    |
| Η η    | Eta          | `H` `h`    |
| Ͱ ͱ    | Heta         | `Qh` `qh`  |
| Θ θ    | Theta        | `U` `u`    |
| Ι ι    | Iota         | `I` `i`    |
| Κ κ    | Kappa        | `K` `k`    |
| Λ λ    | Lambda       | `L` `l`    |
| Μ μ    | Mu           | `M` `m`    |
| Ν ν    | Nu           | `N` `n`    |
| Ξ ξ    | Xi           | `J` `j`    |
| Ο ο    | Omicron      | `O` `o`    |
| Π π    | Pi           | `P` `p`    |
| Ϻ ϻ    | San          | `Qs` `qs`  |
| Ϸ ϸ    | Sho          | `Qx` `qx`  |
| Ϙ ϙ    | Qoppa        | `Qg` `qg`  |
| Ϟ ϟ    |              | `Qq` `qq`  |
| Ρ ρ    | Rho          | `R` `r`    |
| Σ σ ς  | Sigma        | `S` `s` `w` |
| Τ τ    | Tau          | `T` `t`    |
| Υ υ    | Ypsilon      | `Y` `y`    |
| Φ φ    | Phi          | `F` `f`    |
| Χ χ    | Chi          | `X` `x`    |
| Ψ ψ    | Psi          | `C` `c`    |
| Ω ω    | Omega        | `V` `v`    |
| Ϡ ϡ    | Sampi        | `Qt` `qt`  |
| Ͳ ͳ    |              | `Qu` `qu`  |
| Ϛ ϛ    | Stigma       | `Qj` `qj`  |
| ϳ      | Jot          | `qy`       |

### Diacritics

| Diacritic         | Prefix Style | Postfix Style |
| ----------------- | ------------ | ------------- |
| Accute            | `;`          | `/`           |
| Grave             | `` ` ``      | `\`           |
| Circumflex        | `~`          | `=`           |
| Smooth breathing  | `<`          | `[`           |
| Rough breathing   | `>`          | `]`           |
| Diaeresis         | `:`          | `"`           |
| Iota subscript    | (None)       | <code>&#x7C;</code> |
| Breve             | (None)       | `^`           |
| Macron            | (None)       | `-`           |

At this version, there are rules among base letter and diacritics.

- Aspiration is anterior to accent.
- Length mark follows the base letter or located at last of the sequence
- Iota subscript is posterior to the base letter, aspiration, accent.
- Diaeresis is anterior to iota subscript. Diaeresis is anterior to the base letter, or follows the base letter and length. 


### Symbols

| Letter | Name                 | Keymap    |
| ------ | -------------------- | --------- |
| :      | Colon                | `Q`       |
| ;      | Greek Question mark  | `q`       |
| ·      | Interpunct           | `;.`      |
| ᾽      | Greek Apostrofos     | `'`       |
| «      | Open quotation       | `<<` `;<` |
| »      | Close quotation      | `>>` `;>` |
| –      | En-dash              | `--`      |
| –      | Em-dash              | `---`     |
| ϗ      | Kai                  | `&&`      |
| ʹ      | Numeral Mark         | `;#`      |
| ͵      | Lower numeral Mark   | `;##`      |

