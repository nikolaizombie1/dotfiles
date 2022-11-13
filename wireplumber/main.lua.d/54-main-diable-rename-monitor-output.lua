rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_0b_00.1.hdmi-stereo-extra2" },
    },
  },
  apply_properties = {
    ["node.nick"] = "Monitor Speakers",
    ["node.description"] = "Monitor Speakers",
  },
}

table.insert(alsa_monitor.rules, rule)
