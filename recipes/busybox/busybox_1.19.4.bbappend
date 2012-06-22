PRINC := "${@int(PRINC) + 2}"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://fbset.patch"

# Depend on fbset-modes if we have fbset support enabled
python () {
    try:
        defconfig = bb.fetch2.localpath('file://defconfig', d)
    except bb.fetch2.FetchError:
        return

    try:
        configfile = open(defconfig)
    except IOError:
        return

    if 'CONFIG_FBSET=y\n' in configfile.readlines():
        depends = d.getVar('RDEPENDS_busybox', False)
        d.setVar('RDEPENDS_busybox', depends + ' fbset-modes')
}
