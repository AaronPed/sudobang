# Sudobang
Simple little rust program that gives shouting meaning.
Just add a bang `!` to the end of the command and have it executed as `sudo`.

## Examples

```sh
ls!           # becomes: sudo ls
apt update!   # becomes: sudo apt update
docker ps!    # becomes: sudo docker ps
```

## Installation
```sh
git clone https://github.com/aaronped/sudobang.git
cd sudobang
cargo build --release
cargo install --path .
```

## Shell integration
Clone the repo and source the integration script for your shell.
(Or copy the script into your dotfiles.)

```zsh
source /path/to/sudobang/shell/sudobang.zsh
```

```bash
source /path/to/sudobang/shell/sudobang.bash
```

```fish
source /path/to/sudobang/shell/sudobang.fish
```

If you want to change the prefix string (e.g. to `doas`) just set the enviremonet variable:

```bash
export SUDOBANG_PREFIX="doas "

```
# Roadmap

- [ ] Some safety guards (maybe)
- [ ] Packaging
- [ ] Unit tests

---

MIT © Aaron Pedersen
