collection @courseitems
attributes :provider, :name, :description, :organisation, :image, :url, :status, :id
node(:cloned_status) { |courseitem| courseitem.check_cloned_status(@user) }
node(:clone_id) { |courseitem| courseitem.clone_id(@user) }
