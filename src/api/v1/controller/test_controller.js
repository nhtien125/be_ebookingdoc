async function testapi() {
    try {

        return {
            code: 200,
            data:"test",
        };
    } catch (error) {
        throw error;
    }
}


module.exports = {

    testapi
};
