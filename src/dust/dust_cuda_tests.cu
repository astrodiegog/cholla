/*!
* \file dust_cuda_tests.cu
* \author Helena Richie (helenarichie@pitt.edu)
* \brief Test dust model functions
*
*/

// STL Includes
#include <iostream>
#include <string>
#include <math.h>

// External Includes
#include <gtest/gtest.h> // Include GoogleTest and related libraries/headers

// Local Includes
#include "../global/global_cuda.h"
#include "../utils/gpu.hpp"
#include "../utils/testing_utilities.h"
#include "../dust/dust_cuda_updated.h" // Include code to test

#ifdef DUST_GPU

TEST(tDUSTAccretionTest, AccretionTestExpectCorrectOutput) // test suite name, test name
{
    Real const testn = 1;
    Real const testT = pow(10, 5.0);
    Real const testNumber = CIE_cool(testn, testT);

    Real const fiducialNumber = 4.6639082688443984*pow(10, -22);

    double absoluteDiff;
    int64_t ulpsDiff;

    bool isTrue;

    isTrue = testingUtilities::nearlyEqualDbl(fiducialNumber, testNumber, absoluteDiff, ulpsDiff);
    
    EXPECT_TRUE(isTrue)
            << "The fiducial value is:       " << fiducialNumber  << std::endl
            << "The test value is:           " << testNumber      << std::endl
            << "The absolute difference is:  " << absoluteDiff    << std::endl
            << "The ULP difference is:       " << ulpsDiff        << std::endl;
}

#endif // DUST_GPU
