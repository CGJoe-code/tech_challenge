# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include tech_challenge
class tech_challenge (
  $to_port    = $tech_challenge::params::to_port
)inherits tech_challenge::params{
  include tech_challenge::install
  include tech_challenge::service
  include tech_challenge::routing
}
