-- ⌘§ (Command + §): Hide/Unhide WezTerm
hs.hotkey.bind({"cmd"}, "§", function()
  -- pass true for the second param to not pick up browser window titles
  -- and other oddities
  wez = hs.application.find("WezTerm", true)
  if not wez then
    hs.application.launchOrFocus("WezTerm")
  else
    if wez:isFrontmost() then
      wez:hide()
    else
      wez:activate()
    end
  end
end)
