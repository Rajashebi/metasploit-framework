# -*- coding: binary -*-

require 'bindata'

require 'rex/proto/kerberos/credential_cache/primitive'

module Rex::Proto::Kerberos::CredentialCache
  class Krb5CcachePrincipal < BinData::Record
    endian :big
    search_prefix :krb5_ccache

    uint32        :name_type
    uint32        :count_of_components, initial_value: -> { components.length }
    data          :realm
    array         :components, initial_length: :count_of_components, type: :data
  end
end