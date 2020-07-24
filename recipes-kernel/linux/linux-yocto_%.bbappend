FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

INTSIGHTDIR = "intsight"

SRCREV_intsight = "449d507488a12c11715c08d61a136f6b1e7251b0"
SRC_URI_append += "\
	git://gitlab.cs.fau.de/i4/intsight.git;protocol=https;destsuffix=${INTSIGHTDIR};name=intsight \
	file://0001-intspect-kconfig-fix.nopatch; \
	file://intsight.cfg \
"

addtask do_intsight_inject after do_patch before do_kernel_configme
do_intsight_inject () {
	cd "${WORKDIR}/${INTSIGHTDIR}"
	patch < "${WORKDIR}/0001-intspect-kconfig-fix.nopatch"
	"${WORKDIR}/${INTSIGHTDIR}/inject.sh" "${S}"
}
