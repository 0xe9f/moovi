package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import de.bytepark.autoorientation.AutoOrientationPlugin;
import io.flutter.plugins.connectivity.ConnectivityPlugin;
import xyz.apollotv.cplayer.CplayerPlugin;
import flutter.plugins.screen.screen.ScreenPlugin;
import io.flutter.plugins.videoplayer.VideoPlayerPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AutoOrientationPlugin.registerWith(registry.registrarFor("de.bytepark.autoorientation.AutoOrientationPlugin"));
    ConnectivityPlugin.registerWith(registry.registrarFor("io.flutter.plugins.connectivity.ConnectivityPlugin"));
    CplayerPlugin.registerWith(registry.registrarFor("xyz.apollotv.cplayer.CplayerPlugin"));
    ScreenPlugin.registerWith(registry.registrarFor("flutter.plugins.screen.screen.ScreenPlugin"));
    VideoPlayerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.videoplayer.VideoPlayerPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
