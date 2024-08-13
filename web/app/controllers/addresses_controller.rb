class AddressesController < ApplicationController
  def search
    q = params[:q]
    addresses = if q.present?
      QueryableAddress.name_like(q)
    else
      []
    end

    items = {}
    addresses.map { |address| items[address.id] = address.address.name }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "address_search_results",
            partial: "search_results",
            locals: {items: items, q: q}
          )
        )
      end
    end
  end

end
