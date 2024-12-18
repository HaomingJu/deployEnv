#!/usr/bin/env bash

echo "请首先生成ssh key-pair, 并写入gihub账户"

echo "Link & fetch Repo: deployEnv"
pushd ~/deployEnv
    git remote rm origin
    git remote add origin git@github.com:HaomingJu/deployEnv.git
    git fetch #--unshallow
popd

echo "Link & fetch Repo: neovimCfg"
pushd ~/.config/nvim
    git remote rm origin
    git remote add origin git@github.com:HaomingJu/neovimCfg.git
    git fetch #--unshallow
    git rebase origin/master
popd

echo "Link & fetch Repo: Snippets"
pushd ~/.config/Snippets
    git remote rm origin
    git remote add origin git@github.com:HaomingJu/Snippets.git
    git fetch #--unshallow
    git rebase origin/master
popd

echo "Link & fetch Repo: Cheats"
pushd ~/.config/Cheats
    git remote rm origin
    git remote add origin git@github.com:HaomingJu/Cheats.git
    git fetch #--unshallow
    git rebase origin/master
popd

echo "Link & fetch Repo: Wiki"
pushd ~/.config/vimwiki
    git remote rm origin
    git remote add origin git@github.com:HaomingJu/vimwiki.git
    git fetch #--unshallow
    git rebase origin/master
popd
