module FilterableAttribute
    def filters
        @filters = {}
    end
    
    def is_filterable
        return true
    end
end