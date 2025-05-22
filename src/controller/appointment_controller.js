const db = require("../helper/database");


async function getAppointments() {
    try {
        const data = await db.execute(`
              SELECT
                *
              FROM 
                \`appointments\`
            `);

        return {
            code: 200,
            data: data ?? null,
        };
    } catch (error) {
        throw error;
    }
}

module.exports = {
    getAppointments,

};