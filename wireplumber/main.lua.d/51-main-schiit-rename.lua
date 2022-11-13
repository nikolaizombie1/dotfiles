rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-Schiit_Audio_Schiit_Modi_3_-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.nick"] = "Schiit Modi 3+",
    ["node.description"] = "Schiit Modi 3+",
  },
}

table.insert(alsa_monitor.rules, rule)
