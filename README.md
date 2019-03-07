## zenrei.vim

zenrei.vim displays candidates and synonyms for class name, method name and variable name.

![demo](https://user-images.githubusercontent.com/1283492/53975462-3a1de800-4148-11e9-8210-a3de9f41084d.gif)

### Usage

- `:Zenrei <word>`: Display 10 frequently used names with forward match from GitHub's most starred repositories.
- `:ZenreiSynonym <word>`: Display synonyms based on Japanese WordNet database.

### Installation

dein.vim:

```
[[plugins]]
repo = 'typewriter/zenrei.vim'
```

NeoBundle.vim:

```
NeoBundle 'typewriter/zenrei.vim'
```

### License

- [MIT](https://github.com/typewriter/zenrei.vim/blob/master/LICENSE)

