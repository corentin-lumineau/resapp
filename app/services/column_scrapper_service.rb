# This service centralise the calls to the create_or_find method, depending on which service is contained within the arguments.
class ColumnScrapperService
    def initialize(**args)
        @args = args
        @klass = args[:klass]
    end

    def create_or_find
        @klass.new(@args).create_or_find
    end
end