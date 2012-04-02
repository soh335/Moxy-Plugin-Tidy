package Moxy::Plugin::Tidy;

use strict;
use warnings;

use base 'Moxy::Plugin';

use HTML::Tidy;

sub control_panel :Hook {    my ($self, $context, $args) = @_;

    $context->log( debug => "tidy" );
    my $tidy = HTML::Tidy->new;
    $tidy->parse($args->{response}->request->uri->path, $args->{response}->content);

    return $self->render_template(
        $context,
        'panel.tt' => {
            errors => [ map { $_->as_string } $tidy->messages ],
        },
    );
}

1;
__END__

=head1 NAME

Moxy::Plugin::Tidy - Perl extention to do something

=head1 VERSION

This document describes Moxy::Plugin::Tidy version 0.01.

=head1 SYNOPSIS

    use Moxy::Plugin::Tidy;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

<<YOUR NAME HERE>> E<lt><<YOUR EMAIL ADDRESS HERE>>E<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, <<YOUR NAME HERE>>. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
