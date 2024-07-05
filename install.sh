##########################################################################################
#
# Magisk Module Installer Script
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
"

print_modname() {
  ui_print " "
  ui_print " *    SystemLess Resize   *"
  ui_print " *      NavBar 40 DPI     *"
  ui_print " *   For AOSP Android >8  *"
  ui_print " "
}


on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extrayendo archivos..."
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  sleep 1
  ui_print "- Ordenando la casa..."
  rm -rf /data/system/package_cache/*
  sleep 1
  ui_print "- Terminado..."
  ui_print " "
}

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

# You can add more functions to assist your custom script code
