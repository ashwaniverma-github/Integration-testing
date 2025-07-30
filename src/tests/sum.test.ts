import  request  from "supertest";
import { describe ,it , expect } from "vitest";
import { app } from "..";

describe('sum server test',()=>{
    it('Returns sum of two numbers',async()=>{
        const result = await request(app).post('/sum').send({
            a:5,
            b:7
        })

        expect(result.body.answer).toBe(12)
    })
})