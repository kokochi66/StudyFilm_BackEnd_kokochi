const express = require('express')
const http = require('http')
const app = express()
const path = require('path')
const server = http.createServer(app)
const socketIO = require('socket.io')
const moment = require('moment')
const io = socketIO(server)
const chat = require('./chatApp/app')

app.use('/chat', chat)

const PORT = process.env.PORT || 3000;
io.on('connection', (socket) => {
    console.log('소켓으로부터 입력이 들어옴')
    socket.on('chatting', (data) => {
        const { name, msg } = data

        io.emit('chatting', {
            'name':name, 'msg':msg, 'time':moment(new Date()).format('HH:mm A')
        })
    })
})  // 소켓 IO 연결부분, 클라이언트로부터 받은 내용

server.listen(PORT, () => {
    console.log('server connecting' , PORT)
})  // http와 연결된 서버를 리슨한다.