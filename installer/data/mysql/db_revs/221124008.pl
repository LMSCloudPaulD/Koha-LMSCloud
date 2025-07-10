use Modern::Perl;

return {
    bug_number  => "38222",
    description => "Add cancellation reasons to bookings",
    up          => sub {
        my ($args) = @_;
        my ( $dbh, $out ) = @$args{qw(dbh out)};

        $dbh->do(
            q{
            INSERT IGNORE INTO authorised_value_categories (category_name, is_system)
            VALUES
                ('BOOKING_CANCELLATION', 1)
            }
        );
        say( $out, "Added BOOKING_CANCELLATION authorised value category" );
    },
};
