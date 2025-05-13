return {
  "nvim-tree/nvim-web-devicons",
  opts = function(_, opts)
    -- Keep existing opts intact
    opts.override = opts.override or {}

    -- Add NestJS specific pattern matches
    opts.override_by_filename = opts.override_by_filename or {}

    -- Add NestJS pattern matches
    opts.override_by_filename["nest-application.ts"] = {
      icon = "󱎀",
      color = "#E0234E",
      name = "NestJS",
    }
    opts.override_by_filename[".controller.ts"] = {
      icon = "󰘦",
      color = "#E0234E",
      name = "NestController",
    }
    opts.override_by_filename[".service.ts"] = {
      icon = "󰑶",
      color = "#E0234E",
      name = "NestService",
    }
    opts.override_by_filename[".module.ts"] = {
      icon = "󰘦",
      color = "#E0234E",
      name = "NestModule",
    }
    opts.override_by_filename[".resolver.ts"] = {
      icon = "󰗉",
      color = "#E0234E",
      name = "NestResolver",
    }
    opts.override_by_filename[".dto.ts"] = {
      icon = "󰠰",
      color = "#E0234E",
      name = "NestDTO",
    }

    -- Use pattern matching for more complex filenames
    opts.override_by_pattern = opts.override_by_pattern or {}

    -- Add any pattern matches needed
    table.insert(opts.override_by_pattern, {
      pattern = ".*%.controller%.ts$",
      icon = "󰘦",
      color = "#E0234E",
      name = "NestController",
    })
    table.insert(opts.override_by_pattern, {
      pattern = ".*%.service%.ts$",
      icon = "󰑶",
      color = "#E0234E",
      name = "NestService",
    })
    table.insert(opts.override_by_pattern, {
      pattern = ".*%.module%.ts$",
      icon = "󰘦",
      color = "#E0234E",
      name = "NestModule",
    })
    table.insert(opts.override_by_pattern, {
      pattern = ".*%.resolver%.ts$",
      icon = "󰗉",
      color = "#E0234E",
      name = "NestResolver",
    })

    return opts
  end,
}
