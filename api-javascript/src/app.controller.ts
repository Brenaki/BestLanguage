import { Controller, Post, Body, HttpCode } from '@nestjs/common';
import { AppService } from './app.service';
import type { AppDto } from './app.dto';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post()
  @HttpCode(200)
  isPrime(@Body() data: {number: number}): AppDto {
    return { is_prime: this.appService.isPrime(data.number) };
  }
}
