# Provider Block Configuration

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      # Version Constraint: Allows minor version upgrades 6.0.x but prevents automatic major upgrade to 7.0.0,
      # Prevents code from breaking and ensures stability.
      version = "~> 6.0"
    }
  }
}

