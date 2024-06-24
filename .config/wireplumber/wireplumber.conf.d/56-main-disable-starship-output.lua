rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_card.pci-0000_0d_00.4.7" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
