# epiRubocop

This gem is intended to document and enforce the Ruby, Rails and RSpec coding standards used by epiGenesys software engineers.

---

## Installation

1. Add this to your Gemfile:

    ```ruby
    gem "epi-rubocop", require: false, group: [ :development ], git: 'https://github.com/epigenesys/epi-rubocop.git'
    ```

2. Run `bundle install` to install Rubocop.

3. Add a default `.rubocop.yml` file in the root of your application with the following contents:

    ```yml
    # epiGenesys coding standard
    inherit_gem:
      epi-rubocop: rubocop.yml

    # Add project specific rules here, if required
    ```

4. Run `bundle exec rubocop` to check for compliance and `bundle exec rubocop -a` to automatically fix violations.

### Adding to existing projects

When adding this gem to an existing project, you should make a single commit with all of the automatic rubocop changes made to every file.
Ideally this should be done when there is not much ongoing work to minimise disruption to in development branches.

Some of the rules especially those regarding RSpec may require significant re-writing, to avoid requiring a lot of effort before this standard can be used, we also provide a more lax legacy standard.

```yml
# epiGenesys Ruby styling for Rails
inherit_gem:
  epi-rubocop: rubocop-legacy.yml

# Add project specific rules here, if required
```

### Setting up Git to ignore commits for blame

Commits that only contain formatting changes could be shown when using `git blame`, which can hide commits that make more meaningful changes to the code.

To resolve this, you can configure a file with commits that should be ignored when using `git blame`. Find any commits that contain only formatting changes, put their hashes into a file in your repository, and commit it. A common naming convention is `.git-blame-ignore-revs`.

```plain
# .git-blame-ignore-revs

3138f301f381bd2c193a5a6688ebac53ff304b29
e053336135725620d859b7553ab245c24f7a35a1
c304bb5a488647c7fe8a9ffa5957a118dd763461
579cf6411403fd4646a65ddac351ff52583be97a
```

There are several methods to using this file with `git blame`.

1. To use the file whenever you need to use it, you can pass the `--ignore-revs-file` flag to `git blame`

    ```sh
    git blame --ignore-revs-file .git-blame-ignore-revs <file>
    ```

1. You can configure the repository to always use the ignore file when using `git blame`, using the `blame.ignoreRevsFile` option.

    ```sh
    git config set blame.ignoreRevsFile .git-blame-ignore-revs
    ```

1. If you're on Git >= v2.52.0, you can globally set the `blame.ignoreRevsFile` option. Prefix the file path with `:(optional)` to mark the file as optional, which means if the file does not exist in the repository, then that option is ignored. This prevents `git blame` from erroring on repositories which do not have the ignore file.

    ```sh
    # Use quotes to avoid interpretation by the shell
    git config set --global blame.ignoreRevsFile ':(optional).git-blame-ignore-revs'
    ```

### Setting up VSCode to enforce these rules on every save

Automatic enforcement of RuboCop rules is done automatically by the Ruby LSP extension.

### Setting up GitLab CI to check these rules are enforced

Inside your `.gitlab-ci.yml` file, add the following job below any `rspec` or `jest` jobs:

```yml
rubocop:
  stage: test
  extends: .skip-on-scheduled-run
  interruptible: true
  before_script:
    - bundle config --global jobs "$(nproc)"
    - bundle config --local path 'vendor/gems'
    - bundle config --global without oracle

    - bundle check
  needs:
    - job: bundler
  script:
    - bundle exec rubocop
```

---

## Development

The `rubocop.yml` file stores the rubocop rules that this gem enforces. Changes to our teams agreed style can be implemented here, please ensure that each rule also includes a comment detailing what it does.

This project includes a change log to track changes. Please ensure this is kept up to date if you make any changes.

---

## Deployment

1. Update the version number.
2. Update the `change-log.md` to move all of the un-released changes into the new version.
3. Merge the changes into the `main` branch and push to gitLab.

This gem is not currently available on RubyGems.
