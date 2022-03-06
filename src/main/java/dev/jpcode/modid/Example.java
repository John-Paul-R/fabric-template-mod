package dev.jpcode.modid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.fabricmc.api.ModInitializer;

public class ExampleModName implements ModInitializer
{
    public static final Logger LOGGER = LogManager.getLogger("modid");

    @Override
    public void onInitialize()
    {
        LOGGER.info("ExampleModName is getting ready...");
    }
}
