"""config_local.__init__."""
import dynaconf

settings = dynaconf.Dynaconf(
    envvar_prefix="PG",  # False
    #envvar_prefix=False,
    settings_files=["etc/pgadmin4.toml"],
    load_dotenv=True  # Load environment variables from a .env file if you have one
)

items= settings.as_dict(env='default', internal=False)["DEFAULT"]
locals().update(items)

# cleanup local namespace
del dynaconf
del settings
del items