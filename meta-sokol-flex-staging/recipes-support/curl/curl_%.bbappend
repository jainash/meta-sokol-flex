# ---------------------------------------------------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# ---------------------------------------------------------------------------------------------------------------------

EXTRA_OECONF:append = " \
    --with-ca-path=${sysconfdir}/ssl/certs \
"