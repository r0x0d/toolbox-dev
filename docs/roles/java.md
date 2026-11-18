# Java

Config key: `languages.java_development`

## What it installs

**DNF repository:**

- [Eclipse Adoptium](https://adoptium.net/installation/linux/) (`/etc/yum.repos.d/adoptium.repo`)

**DNF packages:**

- `temurin-8-jdk`, `temurin-11-jdk`, `temurin-17-jdk`, `temurin-21-jdk`, `temurin-25-jdk`
- `maven`, `ant`, `unzip`

**Other:**

- Gradle `8.14.3` from services.gradle.org, extracted to `/opt` and linked as
  `/usr/local/bin/gradle` (a fallback -- prefer the project's `./gradlew`)
- `/etc/profile.d/tdx-java.sh`, providing the `use-java` shell function

## Usage

```yaml
languages:
  java_development: true
```

### Tunables

Override any of these in your `config.yml`:

| Variable | Default | Description |
|----------|---------|-------------|
| `java_versions` | `[8, 11, 17, 21, 25]` | Temurin major versions to install |
| `java_default_version` | `21` | JDK selected in new shells |
| `java_gradle_version` | `"8.14.3"` | Gradle distribution to install |

## Switching JDKs

```bash
use-java          # list installed JDKs
use-java 17       # set JAVA_HOME and PATH for the current shell
```

## Notes

Fedora itself only ships the latest OpenJDK. Temurin builds are used so older
projects that still require Java 8/11/17 can be built and tested.
