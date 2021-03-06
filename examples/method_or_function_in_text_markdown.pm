package Text::Markdown;

sub new {
    my ($class) = @_;
 
    my $self = {  };
    bless $self, $class;
    return $self;
}

sub markdown {
    my ( $self, $text, $options ) = @_;
 
    # Detect functional mode, and create an instance for this run
    unless (ref $self) {
        if ( $self ne __PACKAGE__ ) {
            my $ob = __PACKAGE__->new();
                                # $self is text, $text is options
            return $ob->markdown($self, $text);
        }
        else {
            croak('Calling ' . $self . '->markdown (as a class method) is not supported.');
        }
    }
 
    $options ||= {};
 
    %$self = (%{ $self->{params} }, %$options, params => $self->{params});
 
    return $self->_Markdown($text);
}
 
