Zulib = Zulib or {}

Zulib.setupModSlider = function(cfg)
  if not cfg.modId or not cfg.optionId then
    return
  end
  local mod = Mods[cfg.modId]
  if not mod then
    return
  end

  for _, option in ipairs(mod.GetOptionItems and mod:GetOptionItems() or {}) do
    if option.name == cfg.optionId then
      option.GetOptionMeta = function(self)
        local meta = ModItemOptionNumber.GetOptionMeta(self)
        if cfg.displayType then
          meta.valueDisplayType = cfg.displayType
        end
        if cfg.displayPostfix then
          meta.valueDisplayPostfix = cfg.displayPostfix
        end
        return meta
      end
    end
  end


  for _, meta in ipairs(mod.options and mod.options.properties or {}) do
    if meta.id == cfg.optionId then
      if cfg.displayType then
        meta.valueDisplayType = cfg.displayType
      end
      if cfg.displayPostfix then
        meta.valueDisplayPostfix = cfg.displayPostfix
      end
    end
  end
end
