<?php

/*
// Josh Campoverde
// joshcampoverde@gmail.com
// October 13, 2010
//
// Insertion Sort
// Worst case performance: O(n^2)
// Best case performance: O(n)
// Average case performance: O(n^2)
// Worst case space complexity: O(n)
// Wikipedia link: http://en.wikipedia.org/wiki/Insertion_sort
*/

// tested and functional
function insertionSort($arr)
{
    for ($j = 1; $j <= count($arr) - 1; $j++)
    {
        $value = $arr[$j];
        $i = $j - 1;
        $sorted = false;

        while ($sorted == false)
        {
            if ($arr[$i] > $value)
            {
                $arr[$i + 1] = $arr[$i];
                $i = $i - 1;
                if ($i < 0)
                {
                    $sorted = true;
                }
            } else {
                $sorted = true;
            }
        }

        $arr[$i + 1] = $value;
    }
    return $arr;
}

// Very basic test code
// $array = array(-3,100,0,0,0,0,-4,2,1,998,5);
// $sortedArray = insertionSort($array);

// print "Unsorted array:\n";
// print_r($array);
// print "\n";
// print "Sorted array:\n";
// print_r($sortedArray);
