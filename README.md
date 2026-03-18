# Rubocop epigenesys HR

This gem is intended to document and enforce the ruby coding standards for the HR team of epiGenesys.

---

## Installation

First add this to your Gemfile:

```ruby
gem "epi-rubocop", require: false, group: [ :development ]
```

Then run bundle, then bundle binstubs rubocop.

Then add a default .rubocop.yml file in the root of your application with:

```yml
# epiGenesys Ruby styling for Rails
inherit_gem:
  epi-rubocop: rubocop.yml

# Add project specific rules here, if required
```

Now you can run ./bin/rubocop to check for compliance and ./bin/rubocop -a to automatically fix violations.

### Setting up VSCode to enforce these rules on every save

TODO: Add the steps required here.

### Setting up gitlab-ci to check these rules are enforced

TODO: Add the config require here.

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
