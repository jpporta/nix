{ pkgs, lib, config, ... }: {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim configuration";
  };
  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      lua51Packages.luarocks
      lua51Packages.lua
      lua51Packages.jsregexp
      lua-language-server
      python3
      python312Packages.pip
      ripgrep
      tree-sitter
      zig
      nodejs_22
      fd
      unzip
      go
      php
      julia
      cargo
      bun
      pnpm
      yarn
      prettierd
      eslint_d
      typescript
      typescript-language-server
      tailwindcss-language-server
      vscode-langservers-extracted
      nixfmt
    ];
    programs.java.enable = true;
  };
}
