/*
 * The contents of this file are subject to the Interbase Public
 * License Version 1.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy
 * of the License at http://www.Inprise.com/IPL.html
 *
 * Software distributed under the License is distributed on an
 * "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
 * or implied. See the License for the specific language governing
 * rights and limitations under the License.
 *
 * The Original Code was created by Inprise Corporation
 * and its predecessors. Portions created by Inprise Corporation are
 * Copyright (C) Inprise Corporation.
 *
 * All Rights Reserved.
 * Contributor(s): ______________________________________.
 */
	EXEC SQL
        INCLUDE SQLCA

/*  Set up the query statement */
    char *query = "SELECT CITY, STATE, POPULATION FROM CITIES WHERE STATE = 'NY'";

main ()
{
/*  Declare variables to receive data. Note: if it is not
 *  known beforehand the nature of the fields to be
 *  retrieved, it would be necessary to allocate
 *  buffer space for the fields at run time, rather than using
 *  predeclared fields. */
    BASED ON CITIES.CITY city;
    BASED ON CITIES.STATE state;
    BASED ON CITIES.POPULATION population;
    short flag1, flag2, flag3;

/*  Declare and allocate the SQLDA */
    SQLDA *sqlda;
    sqlda = (SQLDA*) malloc (SQLDA_LENGTH (3));
    sqlda->sqln = 3;

    EXEC SQL
        WHENEVER SQLERROR GO TO ERR;

/*  Prepare the query */
    EXEC SQL
        PREPARE Q INTO sqlda FROM :query;

/*  Set up SQLDA to point to declared fields, adjusting
 *  datatypes and setting null terminators on the way
 *  through. Change type for city & state fields to be
 *  TEXT rather than VARYING since C does not know 
 *  about VARYING fields.  The format <datatype> + 1 indicates
 *  that the field is of <datatype> and has an
 *  indicator variable */
    sqlda->sqlvar[0].sqldata = city;
    city [sizeof(city) - 1] = 0;
    sqlda->sqlvar[0].sqlind = &flag1;
    sqlda->sqlvar[0].sqltype = SQL_TEXT + 1;

    sqlda->sqlvar[1].sqldata = state;
    state [sizeof(state) - 1] = 0;
    sqlda->sqlvar[1].sqlind = &flag2;
    sqlda->sqlvar[1].sqltype = SQL_TEXT + 1;

    sqlda->sqlvar[2].sqldata = (char*) &population;
    sqlda->sqlvar[2].sqlind = &flag3;

    EXEC SQL
        DECLARE C CURSOR FOR Q;

    EXEC SQL
        OPEN C;

/*  Fetch and print out records */
    EXEC SQL
        FETCH C USING DESCRIPTOR sqlda;
    while (SQLCODE == 0)
        {
        printf ("%s %s %d\n", city, state, population);
        EXEC SQL
            FETCH C USING DESCRIPTOR sqlda;
        }

    EXEC SQL
	COMMIT RELEASE;

    exit (0);

ERR: printf ("Data base error, SQLCODE = %ld\n", SQLCODE);
    gds__print_status (gds__status);
    exit (1);
}
