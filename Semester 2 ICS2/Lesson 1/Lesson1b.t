%The "Initials" Program
%Lets Draw our Initials

put "*******     *******"
put "*     *     *      "
put "*     *     *      "
put "*******     *      "
put "*     *     *      "
put "*     *     *      "
put "*******     *******"

loop
    put "How many houses do you want?"
    put "Pick a number between 1 - 5"
    var count:int
    get count
    put repeat("     ***     ",count)
    put repeat("    *   *    ",count)
    put repeat("   *     *   ",count)
    put repeat("   *******   ",count)
    put repeat("   *     *   ",count)
    put repeat("   * **  *   ",count)
    put repeat("   * **  *   ",count)
    put repeat("   *******   ",count)
    exit
end loop
