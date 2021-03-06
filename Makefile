PROJECT = katana_code

DEPS = aleppo
TEST_DEPS = mixer xref_runner
SHELL_DEPS = sync
BUILD_DEPS = inaka_mk hexer_mk
LOCAL_DEPS = tools compiler syntax_tools common_test hipe

dep_aleppo       = git https://github.com/inaka/aleppo.git 0.9.10
dep_mixer        = git https://github.com/inaka/mixer.git 0.1.5
dep_sync         = git https://github.com/rustyio/sync.git 9c78e7b
dep_inaka_mk     = git https://github.com/inaka/inaka.mk.git 1.0.0
dep_hexer_mk     = git https://github.com/inaka/hexer.mk.git 1.1.0

DEP_PLUGINS = inaka_mk hexer_mk

include erlang.mk

ERLC_OPTS := +warn_unused_vars +warn_export_all +warn_shadow_vars +warn_unused_import +warn_unused_function
ERLC_OPTS += +warn_bif_clash +warn_unused_record +warn_deprecated_function +warn_obsolete_guard +strict_validation
ERLC_OPTS += +warn_export_vars +warn_exported_vars +warn_missing_spec +warn_untyped_record +debug_info

TEST_ERLC_OPTS += +debug_info
CT_OPTS = -cover test/cover.spec

SHELL_OPTS = -s sync

erldocs:
	erldocs . -o docs
