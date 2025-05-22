const db = require("../helper/database");

async function getPermission() {
    try {
        const data = await db.execute(`
              SELECT
                *
              FROM 
                \`premission\`
            `);

        return {
            code: 200,
            data: data ?? null,
        };
    } catch (error) {
        throw error;
    }
}

async function createPermission(permission) {
    try {
        const data = await db.execute(`
            INSERT INTO \`premission\`(
                \`uuid\`,
                \`name\`
            )
            VALUES(
                ${permission.uuid},
                '${permission.name}'
            )
        `);

        return {
            code: 200,
            message: "Thêm quyền thành công!",
        };
    } catch (error) {
        throw error;
    }
}



module.exports = {
    getPermission,
    createPermission
};
