# epiRubocop

This gem is intended to document and enforce the Ruby, Rails and RSpec coding standards used by epiGenesys software engineers.

---

## Installation

1. Add this to your Gemfile:

    ```ruby
    gem "epi-rubocop", require: false, group: [ :development ], git: 'git@github.com:epigenesys/epi-rubocop.git'
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

### Setting up VSCode to enforce these rules on every save

1. Automatic enforcement of RuboCop rules is done automatically by the Ruby LSP extension.

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
