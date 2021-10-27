#
# Custom Git configurations, functions and aliases for work at CoreMedia
#

pluginDir="$( dirname $0 )"

# Warn if a default plugin is overridden
pluginName="$( basename "${pluginDir}" )"
if [[ -d "${ZSH}/plugins/${pluginName}" ]]; then
  builtin echo "[oh-my-zsh] custom plugin '${pluginName}' overrides default plugin"
fi
unset pluginName

# Integrate selected helper scripts only
pluginBinDir="${pluginDir}/bin"
mkdir -p "${pluginBinDir}"
ln -sfn "${pluginDir}/submodules/scripts/find-jar-contents.sh" "${pluginBinDir}/find-jar-contents"
ln -sfn "${pluginDir}/submodules/scripts/print-jar-manifest.sh" "${pluginBinDir}/print-jar-manifest"
export PATH="${pluginBinDir}:${PATH}"
unset pluginBinDir

unset pluginDir
