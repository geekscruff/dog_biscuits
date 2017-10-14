# frozen_string_literal: true

module DogBiscuits
  class ThesisIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add *all* properties called _resource to ensure the preflabel and altlabel of the related object
    #   are indexed in the _label solr field
    # Method must exist, but can return an empty array
    def labels_to_index
      ['creator', 'advisor', 'department', 'awarding_institution', 'managing_organisation']
    end

    # Add string properties that have a parallel _resource property to ensure they are mixed into the _label solr field
    # Method must exist, but can return an empty array
    def strings_to_index
      ['creator', 'advisor']
    end

    def contributors_to_index
      ['advisor']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc); end
  end
end