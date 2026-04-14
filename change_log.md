# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Each release should be in the following format: [Vx.y.z] - release date yyyy-mm-dd

## V1.2.1 - 2026-04-14

## Added

- Exclude the node-modules folder from rubocop to increase speed. [Issue 5](https://github.com/epigenesys/epi-rubocop/issues/5)
- Add Layout/EmptyLinesAroundAccessModifier cop. [Issue 6](https://github.com/epigenesys/epi-rubocop/issues/6)
- Enabled the Layout/EmptyLines rule. [Issue 8](https://github.com/epigenesys/epi-rubocop/issues/8)

## Changed

- Updated RSpec/NestedGroups to be 5 for the main standard and 7 for the legacy standard. [Issue 1](https://github.com/epigenesys/epi-rubocop/issues/1)
- Removed RSpec/LetSetup from the legacy standard. [Issue 2](https://github.com/epigenesys/epi-rubocop/issues/2)
- Removed Rspec/IndexedLet from the legacy standard. [Issue 3](https://github.com/epigenesys/epi-rubocop/issues/3)

## V1.1.3 - 2026-03-19

### Fixed

- Exclude `config/initializers/version.rb` from cop `Style/StringLiterals` as epiDeploy doesn't support double quotes

## V1.1.2 - 2026-03-18

### Fixed

- Enabled the Layout/IndentationConsistency rule which had been disabled in the Omakase that we inherit from.

## V1.0.0 - 2026-03-18

### Added

- Enforced using double quotes where possible.
- Enforced not indenting methods under private / protected keywords.
- Used [rubocop-rails-omakase](https://github.com/rails/rubocop-rails-omakase) as a base set of rubocop rules.
- Added [rubocop-rspec](https://github.com/rubocop/rubocop-rspec) along with some customisations of the rules.

## Unreleased
