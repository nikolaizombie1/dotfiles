rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-Blue_Microphones_Yeti_Nano_2047SG015WJ8_888-000302040606-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
