
# OpenCode alias - https://opencode.cloudflare.dev/
alias oc="clear && opencode auth login https://opencode.cloudflare.dev && opencode mcp auth cf-portal && opencode"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# bun completions
[ -s "/Users/tomashobza/.bun/_bun" ] && source "/Users/tomashobza/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
