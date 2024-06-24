rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_0d_00.4.iec958-stereo" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
