---@diagnostic disable: undefined-global, lowercase-global

function open_app(name)
	return function()
		hs.application.launchOrFocus(name)
		if name == "Finder" then
			hs.appfinder.appFromName(name):activate()
		end
	end
end

local hyper = { "cmd", "alt", "ctrl", "shift" }

-- bitwarden use raycast instead
-- hs.hotkey.bind(hyper, "b", open_app("Bitwarden")) -- (b)itwarden
hs.hotkey.bind(hyper, "s", open_app("Slack")) -- (s)lack
hs.hotkey.bind(hyper, "e", open_app("Microsoft Outlook")) -- (e)mail
hs.hotkey.bind(hyper, "w", open_app("Firefox")) -- (w)eb
hs.hotkey.bind(hyper, "o", open_app("Obsidian")) -- (o)bsidian
hs.hotkey.bind(hyper, "i", open_app("Insomnia")) -- (i)nsomnia
hs.hotkey.bind(hyper, "t", open_app("Kitty")) -- (t)erminal
hs.hotkey.bind(hyper, "m", open_app("Youtube Music")) -- (m)usic
hs.hotkey.bind(hyper, "c", open_app("ClickUp")) -- (c)lickup
hs.hotkey.bind(hyper, "f", open_app("Figma")) -- (f)igma
hs.hotkey.bind(hyper, "p", open_app("Proxyman")) -- (p)roxyman

hs.hotkey.bind(hyper, "q", open_app("Simulator")) -- q cause unused
hs.hotkey.bind(hyper, "a", open_app("Flipper")) -- a cause under q and unused
