module SteamConfig
	# Enable the Steam Key management?
	Enabled         = false
	# Number of hours you have to wait before asking for another key or.....
	WaitLimit       = 72
	# The number of people who ask, before you can ask again.
	PeopleLimit     = 3
end

$settings = $settings == nil ? {} : $settings

$settings["Steam"] = {
	"Enabled" => false,
	"WaitLimit" => 72,
	"PeopleLimit" => 3,
	"DisabledMessage" => "The Steam module is not enabled.",
}