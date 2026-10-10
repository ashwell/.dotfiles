# Custom Modules
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine
Import-Module -Name CompletionPredictor
Import-Module -Name NerdFonts
Import-Module -Name z

# Environment Variables
$env:PAGER = "less" 
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"
# Config Paths
$env:BAT_CONFIG_PATH = "$env:USERPROFILE\.dotfiles\source\bat.config"

# Settings
# PSReadLineOption
function OnViModeChange {
    # 'Command' or 'Insert'
    if($args[0] -eq 'Command') {
        # Block
        Write-Host -NoNewline "`e[2 q"
    } else {
        # Bar
        Write-Host -NoNewline "`e[5 q"
    }
}
# Block     - blink: "`e[1 q", steady: "`e[2 q"
# Bar       - blink: "`e[5 q", steady: "`e[6 q"
# Underline - blink: "`e[3 q", steady: "`e[4 q"
$PSReadLineOption = @{
    EditMode = "Vi"
    PredictionView = "ListView"
    # ViModeIndicator = "Cursor"
    ViModeIndicator = "Script"
    ViModeChangeHandler = $Function:OnViModeChange
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
}
Set-PSReadLineOption @PSReadLineOption

# vi mode binds this to PossibleCompletions
# MenuComplete mirrors EditMode = "Windows"
Set-PSReadLineKeyHandler -Chord 'Ctrl+Spacebar' -ViMode Insert -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'UpArrow' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord 'DownArrow' -Function HistorySearchForward

# Aliases
Set-Alias ll Get-ChildItem
Set-Alias which Get-Command
Set-Alias c clear

# Oh My Posh setup
# oh-my-posh init pwsh --config jandedobbeleer --eval | Invoke-Expression

# Fast Node Manager Setup (fnm)
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
fnm completions --shell powershell | Out-String | Invoke-Expression

# Completions
gh completion -s powershell | Out-String | Invoke-Expression
bat --completion ps1 | Out-String | Invoke-Expression

# winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}


#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
